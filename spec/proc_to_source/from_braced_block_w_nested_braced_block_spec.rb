require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe "Proc#to_source from { ... } block (w nested { ... } block)" do

  should 'handle simple' do
    (
      lambda {
        lambda { @x1 = 1 }
      }
    ).should.be having_code(%Q\
      proc do
        lambda { @x1 = 1 }
      end
    \)
  end

  should 'handle nested' do
    (
      lambda {
        lambda {
          lambda { @x1 = 1 }
        }
      }
    ).should.be having_code(%Q\
      proc do
        lambda do
          lambda { @x1 = 1 }
        end
      end
    \)
  end

end
