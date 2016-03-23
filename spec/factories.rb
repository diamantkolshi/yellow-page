FactoryGirl.define do
  factory :business_product do
    
  end
  factory :type do
    
  end
  factory :day do
    
  end
  factory :user do
    email "test@example.com"
    password "password"

    factory :admin do
      admin true
    end      
  end

  factory :business do
     name "Mozaix"
  end

  factory :video do
  end
  
end
