package merrymac.sunshinecontacts.dao.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "orgs", schema = "sunshine")
@Data
@NoArgsConstructor
public class Organization {
    @Id
    @Column(name = "id", updatable = false, nullable = false)
    private Long id;

    @Column(name = "org_name", nullable = false)
    private String name;

    @Column(name = "org_type", nullable = false)
    private String type;

    @Column(name="create_timestamp")
    private Timestamp createTimestamp;

    @Column(name="create_user")
    private String createUser;

    @Column(name="last_update_timestamp")
    private Timestamp lastUpdateTimestamp;

    @Column(name="last_update_user")
    private String lastUpdateUser;

    @Column(name="status_code")
    private String statusCode;

    @Column(name="delete_timestamp")
    private Timestamp deleteTimestamp;

    @Column(name="delete_user")
    private String deleteUser;

    @OneToMany(
            mappedBy = "organization",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<OrgPhone> phone = new ArrayList<>();

    @OneToMany(
            mappedBy = "organization",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<OrgAddress> address = new ArrayList<>();

    @OneToMany(
            mappedBy = "organization",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<OrgAction> orgActions = new ArrayList<>();

}
