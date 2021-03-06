
###
# This Ruby source file was generated by test-to-ruby.xsl
# and is a derived work from the source document.
# The source document contained the following notice:
=begin

Copyright (c) 2001 World Wide Web Consortium,
(Massachusetts Institute of Technology, Institut National de
Recherche en Informatique et en Automatique, Keio University). All
Rights Reserved. This program is distributed under the W3C's Software
Intellectual Property License. This program is distributed in the
hope that it will be useful, but WITHOUT ANY WARRANTY; without even
the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
See W3C License http://www.w3.org/Consortium/Legal/ for more details.

=end
#

require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'helper'))

###
#     If the sum of the offset and count used in the        
#    "deleteData(offset,count) method is greater than the
#    length of the character data then all the characters
#    from the offset to the end of the data are deleted. 
#    
#    Retrieve the character data from the last child of the
#    first employee.  The "deleteData(offset,count)"
#    method is then called with offset=4 and count=50.
#    The method should delete the characters from position 4
#    to the end of the data since the offset+count(50+4)
#    is greater than the length of the character data(35).
#    The new value of the character data should be "1230".
# @author Curt Arnold
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-72AB8359]
# see[http://www.w3.org/TR/1998/REC-DOM-Level-1-19981001/level-one-core#ID-7C603781]
##
DOMTestCase('hc_characterdatadeletedataexceedslength') do

  ###
  # Constructor.
  # @param factory document factory, may not be null
  # @throws org.w3c.domts.DOMTestIncompatibleException Thrown if test is not compatible with parser configuration
  ##
  def setup
    ##
    ##   check if loaded documents are supported for content type
    ##
    contentType = getContentType()
    preload(contentType, "hc_staff", true)
  end

  ###
  # Runs the test case.
  # @throws Throwable Any uncaught exception causes test to fail
  #
  def test_hc_characterdatadeletedataexceedslength
    doc = nil
    elementList = nil
    nameNode = nil
    child = nil
    childData = nil
    doc = load_document("hc_staff", true)
      elementList = doc.getElementsByTagName("acronym")
      nameNode = elementList.item(0)
      child = nameNode.firstChild()
      child.deleteData(4, 50)
      childData = child.data()
      assert_equal("1230", childData, "characterdataDeleteDataExceedsLengthAssert")
            
  end

  ###
  # Gets URI that identifies the test.
  # @return uri identifier of test
  #
  def targetURI
    "http://www.w3.org/2001/DOM-Test-Suite/tests/Level-1/hc_characterdatadeletedataexceedslength"
  end
end

