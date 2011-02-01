module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "Trænings dagbog"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def logo
      image_tag("logo.png")
    end
    
    def facebook
        image_tag("facebook_32.png")
      end
      
      def twitter
          image_tag("twitter_32.png")
        end
        
        def youtube
            image_tag("youtube_32.png")
          end
  end