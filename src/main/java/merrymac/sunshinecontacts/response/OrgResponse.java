package merrymac.sunshinecontacts.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import merrymac.sunshinecontacts.dao.entity.OrgAction;
import merrymac.sunshinecontacts.dao.entity.OrgAddress;
import merrymac.sunshinecontacts.dao.entity.OrgAlias;
import merrymac.sunshinecontacts.dao.entity.OrgPhone;

import java.sql.Timestamp;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrgResponse {
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
    private List<OrgPhone> phones;
    private List<OrgAddress> addresses;
    private List<OrgAction> actions;
    private List<OrgAlias> aliases;

}
