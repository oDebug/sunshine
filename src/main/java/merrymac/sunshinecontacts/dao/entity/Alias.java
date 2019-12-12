package merrymac.sunshinecontacts.dao.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "aliases", schema = "sunshine")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Alias implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", updatable=false, nullable=false)
    private Long id;

    @Column(name="name")
    private String alias;

    @Column(name="contact_id", insertable = false, updatable = false)
    private Long contactId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="contact_id")
    private Contact contact;

}
