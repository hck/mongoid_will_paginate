require File.expand_path('./spec_helper', File.dirname(__FILE__))

describe MongoidWillPaginate::Criteria do
  before :all do
    class Document
      include ::Mongoid::Document
      field :title, type: String
    end
  end
  
  describe :paginate do
    context 'called in a Mongoid::Criteria' do
      before :each do
        @docs = 15.times.map{|i| Document.create title: 'document title'}
        15.times{Document.create title: 'document title 2'}

        @criteria = Document.where(title: 'document title')
      end

      context '& paginate params specified' do
        subject {@criteria.paginate page: 2, per_page: 5}
        it {should be_a_instance_of WillPaginate::Collection}
        its(:to_a) {should == @docs[5..9]}
        its(:total_entries) {should == @criteria.count}
      end

      context '& paginate parameters not specified' do
        subject {@criteria.paginate}
        it {should be_a_instance_of WillPaginate::Collection}
        its(:to_a) {should == @docs}
        its(:total_entries) {should == @criteria.count}
      end
    end
  end
end
