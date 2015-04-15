require 'rails_helper'

describe PostPolicy do
  subject { PostPolicy.new(author, post) }
  let(:post)   { create :post_with_author }

  before :each do
    allow_any_instance_of(Twitter::REST::Client).to receive(:update).and_return(twitter_status_update_response)
  end

  context "for a visitor" do
    let(:author) { nil }

    it { should allow_access(:show)  }
    it { should allow_access(:index) }

    it { should_not allow_access(:new)     }
    it { should_not allow_access(:create)  }
    it { should_not allow_access(:edit)    }
    it { should_not allow_access(:update)  }
    it { should_not allow_access(:destroy) }
  end

  context "for the author" do
    let(:author) { post.author }

    it { should allow_access(:show)  }
    it { should allow_access(:index) }

    it { should allow_access(:new)     }
    it { should allow_access(:create)  }
    it { should allow_access(:edit)    }
    it { should allow_access(:update)  }
    it { should allow_access(:destroy) }
  end

  context "for a different author" do
    let(:author) { create :another_author }

    it { should allow_access(:show)   }
    it { should allow_access(:index)  }
    it { should allow_access(:new)    }
    it { should allow_access(:create) }

    it { should_not allow_access(:edit)    }
    it { should_not allow_access(:update)  }
    it { should_not allow_access(:destroy) }
  end
end
