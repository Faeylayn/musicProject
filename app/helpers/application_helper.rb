module ApplicationHelper

  def ugly_lyrics(lyrics)
      output = "<pre>"
      new_lyrics = lyrics.split(/\r?\n/)
      new_lyrics.each do |line|
        output += "&#9835" + h(line) + "\n"
      end
      output += '</pre>'
      output.html_safe

      # output = h(lyrics).gsub(/\r\n/, /\r\n/'&#9835')
      # output.html_safe



      #lyrics


  end

end
