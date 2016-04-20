require 'spec_helper'

RSpec.describe MongoidWillPaginate::Criteria do
  class Document
    include ::Mongoid::Document
    field :title, type: String
  end

  describe '#paginate' do
    let!(:docs) do
      15.times.map { Document.create(title: 'document title') }
    end
    let(:criteria) { Document.where(title: 'document title') }

    before(:each) do
      15.times { Document.create(title: 'document title 2') }
    end

    context 'when paginate params specified' do
      subject { criteria.paginate(page: 2, per_page: 5) }

      it { expect(subject).to be_a_instance_of(WillPaginate::Collection) }
      it { expect(subject.to_a).to eq(docs[5..9]) }
      it { expect(subject.total_entries).to eq(criteria.count) }
    end

    context 'when paginate parameters not specified' do
      subject { criteria.paginate }

      it { expect(subject).to be_a_instance_of(WillPaginate::Collection) }
      it { expect(subject.to_a).to eq(docs) }
      it { expect(subject.total_entries).to eq(criteria.count) }
    end
  end
end
