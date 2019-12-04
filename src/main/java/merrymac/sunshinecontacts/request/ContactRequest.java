package merrymac.sunshinecontacts.request;

import lombok.Data;
import lombok.NoArgsConstructor;

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
