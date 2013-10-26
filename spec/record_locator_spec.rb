require 'spec_helper'

require File.expand_path(File.dirname(__FILE__) + '/../lib/record_locator_util')
require File.expand_path(File.dirname(__FILE__) + '/../models/book')

describe 'RecordLocator' do

  describe 'EncoderAndDecoder' do
    it "Should check equality of original value with decoded value" do
      original = 202345
      encoded = Util::Base::encode(original)
      decoded = Util::Base::decode(encoded)
      original.should == decoded
    end
    it "Should not contain confused characters(l,1,0,O,Q) after encode" do
      original = 12345678909876321
      encoded = Util::Base::encode(original)
      encoded = encoded.split("")
      encoded.include?('l').should == false
      encoded.include?('1').should == false
      encoded.include?('0').should == false
      encoded.include?('O').should == false
      encoded.include?('Q').should == false
    end
  end

  before(:each) do
    @book = Book.find_or_create_by(publisher_id: '1234567890')
  end

  it "Should return defined record locator filed" do
    @book.record_locator_field.should == :publisher_id
  end

  it "Should not have record locator field nil" do
    @book.encoded_record_locator.should_not be_nil
  end

  it "Should equal ActiveRecord locator decoded value with original ActiveRecord field value" do
    @book.publisher_id.should == Util::Base::decode(Util::Base::encode(@book.publisher_id))
  end

  it "Should Return class type Finder" do
    Book.record_locator.class.to_s.should == 'Finder'
  end

  it "Should Return class type Book" do
    encoded_field = @book.encoded_record_locator
    @book.class.should == Book.record_locator.find(encoded_field).class
  end

  it "Should return Original ActiveRecord Object found by defined encoded filed instead of Active record finder" do
    encoded_field = @book.encoded_record_locator
    @book.should === Book.record_locator.find(encoded_field)
  end


end