FactoryGirl.define do
  factory :business_address do
    
  end
  factory :address do
    
  end
  factory :rating do
    
  end
  factory :search do
    
  end
  factory :suggest_photo do
    
  end
  factory :suggest_edit do
    
  end
  factory :suggest_business do
    
  end
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
    business_id 1
    source "adasdas"
  end
end
