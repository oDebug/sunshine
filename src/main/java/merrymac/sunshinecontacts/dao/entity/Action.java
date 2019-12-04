package merrymac.sunshinecontacts.dao.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@Table(name = "actions", schema = "sunshine")
public class Action implements Serializable {

    @Id
    @Column(name="id", updatable=false, nullable=false)
    private Long id;

    @Column(name="contact_id", updatable = false)
    private Long contactId;

    @Column(name="action_type")
    private String actionType;

    @Column(name="status")
    private String status;

    @Column(name="notes")
    private String notes;

    @Column(name="due_date")
    private Date dueDate;

    @Column(name="create_user")
    private String createUser;

    @Column(name="create_date")
    private Date createDate;

    @Column(name="complete_date")
    private Date completeDate;

    @Column(name="complete_user")
    private String completeUser;

}
