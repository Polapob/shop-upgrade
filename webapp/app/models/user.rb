class User < ApplicationRecord
    has_secure_password
    has_many :markets
    has_many :items
    has_many :inventories, foreign_key: "buyer_id", primary_key:"id"

    before_save :downcase_email
    enum user_type: [:admin,:seller,:buyer]
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true

    def confirm!
        update_columns(confirmed_at: Time.current)
      end
    
      def confirmed?
        confirmed_at.present?
      end
    
      def generate_confirmation_token
        signed_id expires_in: CONFIRMATION_TOKEN_EXPIRATION, purpose: :confirm_email
      end
    
      def unconfirmed?
        !confirmed?
      end

    private

    def downcase_email
      self.email = email.downcase
    end
end
