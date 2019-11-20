package merrymac.sunshinecontacts.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import merrymac.sunshinecontacts.dao.entity.Organization;

import javax.persistence.Column;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrgActionResponse {
    private Long id;
    private Organization organization;
    private String actionType;
    private boolean completed;
    private String notes;
    private Date dueDate;
    private String createUser;
    private Date createDate;
    private Date completeDate;
    private String completeUser;
}
