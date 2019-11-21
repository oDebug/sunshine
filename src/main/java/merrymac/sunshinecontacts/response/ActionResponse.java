package merrymac.sunshinecontacts.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import merrymac.sunshinecontacts.dao.entity.Contact;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ActionResponse {
    private Long id;
    private Contact contact;
    private String actionType;
    private boolean completed;
    private String notes;
    private Date dueDate;
    private String createUser;
    private Date createDate;
    private Date completeDate;
    private String completeUser;
}
