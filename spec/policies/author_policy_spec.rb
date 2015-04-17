require 'spec_helper'

describe AuthorPolicy do

  let(:author) { create :author }
  let(:another_author) { create :another_author}

  context "for a visitor" do
    subject { AuthorPolicy.new(nil, author) }
    it { should_not allow_access(:update) }
  end

  context "for the author" do
    subject { AuthorPolicy.new(author, author) }
    it { should allow_access(:update) }
  end

  context "for a different author" do
    subject { AuthorPolicy.new(another_author, author) }
    it { should_not allow_access(:update) }
  end

end
