package merrymac.sunshinecontacts.dao.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "org_address", schema = "sunshine")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrgAddress implements Serializable {
    @Id
    @GeneratedValue
    @Column(name="id", updatable=false, nullable=false)
    private Long id;

    @Column(name="org_id", insertable = false, updatable = false)
    private Long org_id;

    @Column(name="street")
    private String street;

    @Column(name="city")
    private String city;

    @Column(name="state")
    private String state;

    @Column(name="postal_code")
    private Long postalCode;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="org_id")
    private Organization organization;

}
