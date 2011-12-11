module Taka
  module DOM
    module HTML
      module Document
        def title
            begin
              at('.//title').text
            rescue
                ''
            end
        end

        # Returns the URI of the page that linked to this page. The value is
        # an empty string if the user navigated to the page directly (not
        # through a link, but, for example, via a bookmark).
        def referrer
          ''
        end

        # The domain name of the server that served the document, or a null
        # string if the server cannot be identified by a domain name.
        def domain
          ''
        end

        def body
          at('.//body')
        end

        def images
          xpath('.//img')
        end

        def applets
          xpath('.//object[applet]', './/applet')
        end

        def URL
          url
        end

        def links
          xpath('.//area[@href]', './/a[@href]')
        end

        def forms
          xpath('.//form')
        end

        def anchors
          xpath('.//a[@name]')
        end

        # The cookies associated with this document. If there are none, the
        # value is an empty string. Otherwise, the value is a string: a
        # semicolon-delimited list of "name, value" pairs for all the cookies
        # associated with the page. For example, name=value;expires=date.
        def cookie
          ''
        end

        def getElementsByName name
          xpath(".//*[@name='#{name}']")
        end

        def open
          children.each { |child| child.unlink }
        end

        def write string
          @tmp_doc ||= ''
          @tmp_doc << string
          close
        end

        def writeln string
          write("#{string}\n")
        end

        def close
          @tmp_doc ||= nil
          return unless @tmp_doc

          document.fragment(@tmp_doc || '').children.each {
            |node|
            document.at_css( 'body' ).add_next_sibling node
          }
          @tmp_doc = nil
        end
      end
    end
  end
end
