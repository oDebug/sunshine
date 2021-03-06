package merrymac.sunshinecontacts.dao.entity;

import lombok.AllArgsConstructor;
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

@Entity
@Table(name = "aliases", schema = "sunshine")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Alias implements Serializable {
    @Id
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
