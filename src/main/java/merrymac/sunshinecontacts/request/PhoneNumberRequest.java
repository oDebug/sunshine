package merrymac.sunshinecontacts.request;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PhoneNumberRequest {
    private String contactId;
    private String phone;
    private String type;
    private String extension;
}
