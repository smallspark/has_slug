class String
  # convert strings to slugs that are lowercase an only contain alphanumeric
  # characters, dashes and sometimes dots
  def to_slug(options = {})
    slug = self
    
    preserve    = options.delete(:preserve).to_s.split
    acceptable  = preserve + ["-", "_"]
    
    # Transliterate
    if defined?(Unicode) && Unicode.respond_to?(:normalize_KD)
      slug = Unicode.normalize_KD(slug).gsub(/[^\x00-\x7F]/n,'')
    elsif defined?(UnicodeUtils) && UnicodeUtils.respond_to?(:compatibility_decomposition)
      slug = UnicodeUtils.compatibility_decomposition(slug).gsub(/[^\x00-\x7F]/n,'')
    end

    # Convert to lowercase
    slug.downcase!
    
    # Change all characters that are not to be preserved to dashes
    slug.gsub!(Regexp.new("[^a-z0-9#{Regexp.escape(preserve.join)}]"), '-')
  
    # Preservable chars should be saved only when they have letter or number on 
    # both sides (this preserves file extensions in case of :preserve => '.')
    preserve.each do |char|      
      slug.gsub!(Regexp.new("([^a-z0-9])#{Regexp.escape(char)}+"), '\\1-')
      slug.gsub!(Regexp.new("#{Regexp.escape(char)}+([^a-z0-9])"), '-\\1')
      slug.gsub!(Regexp.new("^#{Regexp.escape(char)}+"), '')
      slug.gsub!(Regexp.new("#{Regexp.escape(char)}+$"), '')
    end
    
    # Strip dashes from begining and end
    slug.gsub!(/^-(.+)+/, '\1')
    slug.gsub!(/(.+)-+$/, '\1')

    # Change multiple succesive dashes to single dash.
    slug.gsub!(/-+/, '-')
    
    slug
  end
end