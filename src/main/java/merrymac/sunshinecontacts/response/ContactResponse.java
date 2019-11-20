package merrymac.sunshinecontacts.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import merrymac.sunshinecontacts.dao.entity.Action;
import merrymac.sunshinecontacts.dao.entity.Address;
import merrymac.sunshinecontacts.dao.entity.Alias;
import merrymac.sunshinecontacts.dao.entity.PhoneNumber;

import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContactResponse {
    private Long id;
    private String name;
    private String type;
    private Timestamp createTimestamp;
    private String createUser;
    private Timestamp lastUpdateTimestamp;
    private String lastUpdateUser;
    private String statusCode;
    private Timestamp deleteTimestamp;
    private String deleteUser;
    private String denomination;
    private List<PhoneNumber> phones;
    private List<Address> addresses;
    private List<Action> actions;
    private List<Alias> aliases;

}
