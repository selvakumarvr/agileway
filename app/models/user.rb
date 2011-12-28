class User < ActiveRecord::Base

		 validates :login, :confirmation => true,
                      
                       :presence => true
					  validates :name, :confirmation => true,
                     
                       :presence => true
					   
validates :email, :uniqueness => true, 
                    :length => { :within => 5..50 }, 
                    :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }
  validates :password, :confirmation => true,
                       :length => { :within => 4..20 },
                       :presence => true
					   
			

 has_many :tasklists
 

end
