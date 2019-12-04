package merrymac.sunshinecontacts.request;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ActionRequest {
    private String actionType;
    private String notes;
    private String status;
    private String contactId;
}
