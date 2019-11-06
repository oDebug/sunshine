package merrymac.sunshinecontacts.dao.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@Table(name = "org_actions", schema = "sunshine")
public class OrgAction implements Serializable {

    @Id
    @GeneratedValue
    @Column(name="id", updatable=false, nullable=false)
    private Long id;

    @Column(name="org_id", insertable = false, updatable = false)
    private Long org_id;

    @Column(name="action_type")
    private String actionType;

    @Column(name="complete_status")
    private boolean completed;

    @Column(name="action_notes")
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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="org_id")
    private Organization organization;

}
