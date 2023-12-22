def extract_last_9_digits(phone_number)
    return nil if phone_number.nil?
    numeric_digits = phone_number.scan(/\d/).join('')

    last_9_digits = numeric_digits[-9..-1]

    last_9_digits
end

require 'csv'

def import_csv(file_path, model_class)
    CSV.foreach(file_path, headers: true) do |row|
        tracking_id = row['ID']
        if model_class.to_s == 'Pickup'
            user_contact = extract_last_9_digits(row['User Mobile'])
        else 
            user_contact = extract_last_9_digits(row['User contact'])
        end

        p user_contact

        record = model_class.find_or_initialize_by(tracking_id: tracking_id)

        case model_class.to_s
        when 'Pickup'
            record.card_id = row['Card ID']
            record.user_contact = user_contact
            record.pickup_time = row['Timestamp']
        when 'DeliveryException'
            record.card_id = row['Card ID']
            record.user_contact = user_contact
            record.exception_time = row['Timestamp']
            record.comment = row['Comment']
        when 'Delivered'
            record.card_id = row['Card ID']
            record.user_contact = user_contact
            record.delivered_time = row['Timestamp']
            record.comment = row['Comment']
        when 'Returned'
            record.card_id = row['Card ID']
            record.user_contact = user_contact
            record.return_time = row['Timestamp']
        end

        record.save!
    end
end


import_csv('data/Sample Card Status Info - Pickup.csv', Pickup)
import_csv('data/Sample Card Status Info - Delivery exceptions.csv', DeliveryException)
import_csv('data/Sample Card Status Info - Delivered.csv', Delivered)
import_csv('data/Sample Card Status Info - Returned.csv', Returned)


