require 'rails_helper'

describe PostPolicy do
  subject { PostPolicy.new(author, post) }
  # let(:other_author{create :author }
  before :each do
    allow_any_instance_of(Twitter::REST::Client).to receive(:update).and_return(twitter_status_update_response)
  end

  context "for a visitor" do
    let(:author) { nil }
    let(:post)   { create :post_with_author }

    it { should allow_access(:show)  }
    it { should allow_access(:index) }

    it { should_not allow_access(:new)     }
    it { should_not allow_access(:create)  }
    it { should_not allow_access(:edit)    }
    it { should_not allow_access(:update)  }
    it { should_not allow_access(:destroy) }
  end
end
