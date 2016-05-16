require 'rubygems'
require 'inline'

class MBID
  inline(:C) do |builder|
    builder.include "\"#{Dir.getwd}/MBID.h\""
    builder.include "\"#{Dir.getwd}/MBID.c\""
    builder.c <<-ENDC
      char *get_mbid(const char *path) {
        char mbid[MBID_BUFFER_SIZE];
        if (parse_mbid(path, mbid) == 0) {
          return mbid;
        }
        return "";
      }
    ENDC
  end
end

mbid = MBID.new
puts mbid.get_mbid('/path/to/file.mp3')
