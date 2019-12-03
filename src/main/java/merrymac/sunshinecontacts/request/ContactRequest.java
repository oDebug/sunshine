package merrymac.sunshinecontacts.request;

import lombok.Data;
import lombok.NoArgsConstructor;
import merrymac.sunshinecontacts.dao.entity.Address;
import merrymac.sunshinecontacts.dao.entity.Contact;
import merrymac.sunshinecontacts.dao.entity.PhoneNumber;

import java.util.List;

@Data
@NoArgsConstructor
public class ContactRequest {
    private String name;
    private String type;
    private String email;
    private String description;
    private String street;
    private String suite;
    private String city;
    private String state;
    private String zip;
    private String addressType;
    private String phone;
    private String phoneType;


}
