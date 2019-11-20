package merrymac.sunshinecontacts.dao.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Timestamp;

@Data
@Table(name = "user_table", schema = "sunshine")
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class User
{
    @Id
    @Column(name = "id", updatable = false, nullable = false)
    private String id;

    @Column(name = "pw", nullable = false)
    private String pw;

    @Column(name="date_created")
    private Timestamp dateCreated;
}
