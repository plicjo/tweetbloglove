require 'rails_helper'

describe PostPolicy do
  
  before :each do
    allow_any_instance_of(Twitter::REST::Client).to receive(:update).and_return(twitter_status_update_response)
  end

  context "for a visitor" do
    subject { PostPolicy.new(author, post) }
    let(:post)   { create :post_with_author }
    let(:author) { nil }

    it { should allow_access(:index) }

    it { should_not allow_access(:new)     }
    it { should_not allow_access(:create)  }
    it { should_not allow_access(:edit)    }
    it { should_not allow_access(:update)  }
    it { should_not allow_access(:destroy) }
  end

  context "for the author" do
    subject { PostPolicy.new(author, post) }
    let(:post)   { create :post_with_author }
    let(:author) { post.author }

    it { should allow_access(:index) }
    it { should allow_access(:new)     }
    it { should allow_access(:create)  }
    it { should allow_access(:edit)    }
    it { should allow_access(:update)  }
    it { should allow_access(:destroy) }
  end

  context "for a different author" do
    subject { PostPolicy.new(author, post) }
    let(:post)   { create :post_with_author }
    let(:author) { create :another_author }

    it { should allow_access(:index)  }
    it { should allow_access(:new)    }
    it { should allow_access(:create) }

    it { should_not allow_access(:edit)    }
    it { should_not allow_access(:update)  }
    it { should_not allow_access(:destroy) }
  end

  context "viewing a post" do
    subject { PostPolicy }
    let(:another_author) { create :another_author }
    
    permissions :show? do

      context "published post" do
        let(:published_post) { create :published_post }

        it "grants access to visitors" do
          expect(subject).to permit(nil, published_post)
        end

        it "grants access to the post author" do
          expect(subject).to permit(published_post.author, published_post)
        end

        it "grants access to a different author" do
          expect(subject).to permit(another_author, published_post)
        end
      end

      context "unpublished post" do
        let(:unpublished_post) { create :post_with_author }

        it "denies access to visitors" do
          expect(subject).to_not permit(nil, unpublished_post)
        end  

        it "grants access to the post author" do
          expect(subject).to permit(unpublished_post.author, unpublished_post)
        end

        it "denies access to a different author" do
          expect(subject).to_not permit(another_author, unpublished_post)
        end
      end
      
    end
  end
end
