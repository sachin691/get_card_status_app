class CardStatusController < ApplicationController

    def get_card_status
        request_payload = JSON.parse(request.body.read)
      
        if request_payload.present?
          user_phone = request_payload['user_contact']
          
            begin
                verify_phone(user_phone) if user_phone.present?
                card_id = request_payload['card_id']
        
                if card_id.blank? && user_phone.present?
                card_id = find_card_id_by_user_phone(user_phone)
                elsif user_phone.blank? && card_id.present?
                user_phone = find_user_phone_by_card_id(card_id)
                end
        
                card_status = find_card_status(card_id, user_phone)
                render json: { user_phone: user_phone, card_id: card_id, status: card_status }
            rescue StandardError => e
                render json: { error: e.message }
            end
        else 
          render json: { error: "Please provide user contact or card id" }
        end
    end
      
  
    private
  
    def find_card_status(card_id, user_phone)
        return 'Card has been Delivered' if Delivered.where("card_id = ? OR user_contact = ?", card_id, user_phone).exists?
        return 'Card has been Returned' if Returned.where("card_id = ? OR user_contact = ?", card_id, user_phone).exists?
        return 'Delivery Exception, will try to redeliver' if DeliveryException.where("card_id = ? OR user_contact = ?", card_id, user_phone).exists?
        return 'Card is Picked up by our delivery partner' if Pickup.where("card_id = ? OR user_contact = ?", card_id, user_phone).exists?
        
        'Card Not Found'
    end

    def verify_phone(phone_number)
        unless /^\d{9}$/.match?(phone_number)
            raise StandardError.new("Invalid phone number. Must contain exactly 9 digits.")
        end
    end

    def find_user_phone_by_card_id(card_id)
        Pickup.find_by(card_id: card_id)&.user_contact
    end
    
    def find_card_id_by_user_phone(user_phone)
        Pickup.find_by(user_contact: user_phone)&.card_id
    end
end
  