return
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'helper'))

module JQuery
  class TestJQuery < TestCase

    def test_jquery
      Dir.chdir 'vendor/jquery' do
        doc = Taka::DOM::HTML(File.read('jquery/test/index.html'))
        scripts = doc.getElementsByTagName 'script'
        rt = Johnson::Runtime.new

        rt['window']    = FakeWindow.new
        rt['navigator'] = FakeNavigator.new
        rt['console']   = PoorMansFirebug.new
        rt['document']  = doc

        scripts.each do |tag|
          if tag['src']
            filename = File.expand_path(tag['src'].sub('../dist', 'jquery/dist'))
            puts "(running #{tag['src']} ...)" ; STDOUT.flush
            rt.evaluate File.read(filename), filename, 1
          else
            rt.evaluate tag.content
          end
        end
      end
    end

  end
end
