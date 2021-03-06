package merrymac.sunshinecontacts.dao.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;
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

    @Column(name = "email")
    private String email;

    @Column(name="create_timestamp", updatable = false)
    private Timestamp createTimestamp;

    @Column(name="create_user", updatable = false)
    private String createUser;

    @Column(name="last_update_timestamp")
    private Timestamp lastUpdateTimestamp;

    @Column(name="last_update_user")
    private String lastUpdateUser;

    @Column(name="status_code")
    @ColumnDefault(value = "A")
    private String statusCode;

    @Column(name="delete_timestamp")
    private Timestamp deleteTimestamp;

    @Column(name="delete_user")
    private String deleteUser;

    @Column(name="notes")
    private String notes;

}
