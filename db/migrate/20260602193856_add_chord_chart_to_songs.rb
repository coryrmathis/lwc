class AddChordChartToSongs < ActiveRecord::Migration[7.2]
  def change
    add_column :songs, :chord_chart, :text
  end
end
