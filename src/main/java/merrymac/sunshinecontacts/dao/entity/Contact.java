package merrymac.sunshinecontacts.dao.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Timestamp;

@Entity
@Table(name = "contacts", schema = "sunshine")
@Data
@NoArgsConstructor
public class Contact {
    @Id
    @Column(name = "id", updatable = false, nullable = false)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "type", nullable = false)
    private String type;

    @Column(name = "denomination")
    private String denomination;

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

}
