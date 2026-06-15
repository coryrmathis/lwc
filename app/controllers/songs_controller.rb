class SongsController < ApplicationController
  before_action :set_song, only: %i[show edit update destroy generate_chart]

  def index
    @songs = Song.order(:title)
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to @song, notice: "Song created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song, notice: "Song updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path, notice: "Song deleted."
  end

  def generate_chart
    description = params[:description].to_s.strip
    render json: { error: "Description is required." }, status: :unprocessable_entity and return if description.blank?

    client = Anthropic::Client.new(api_key: ENV["LWC_ANTHROPIC_API_KEY"])
    response = client.messages.create(
      model: "claude-sonnet-4-6",
      max_tokens: 1024,
      system: <<~SYSTEM,
        You are a music transcription assistant. Output valid ChordPro format only.
        No explanations, no markdown fences, no extra text — just the ChordPro content.
        Use {start_of_verse}, {start_of_chorus}, {start_of_bridge} section markers as appropriate.
        Use [Chord] notation inline with lyrics, or grid lines like [Cm] / / / when no lyrics.
        Always include {title:}, {key:}, and {time:} directives at the top.
      SYSTEM
      messages: [
        {
          role: "user",
          content: <<~MSG
            Song metadata:
            - Title: #{@song.title}
            - Key: #{@song.key.presence || "unknown"}
            - Time signature: #{@song.notes.presence ? "see notes" : "4/4 (assume if not specified)"}
            - BPM: #{@song.bpm.presence || "unknown"}

            Description: #{description}

            Generate a ChordPro chord chart for this song.
          MSG
        }
      ]
    )
    byebug
    chord_chart = response.content.first.text
    render json: { chord_chart: chord_chart }
  rescue => e
    render json: { error: "Failed to generate chart: #{e.message}" }, status: :internal_server_error
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :bpm, :length_seconds, :lyrics, :notes, :status, :key, :is_cover, :original_artist, :chord_chart)
  end
end
