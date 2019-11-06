package merrymac.sunshinecontacts.dao.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "org_phone", schema = "sunshine")
@Data
@NoArgsConstructor
public class OrgPhone {
    @Id
    @Column(name = "id", updatable = false, nullable = false)
    private Long id;

    @Column(name = "org_id", insertable = false, updatable = false)
    private Long orgId;

    @Column(name = "phone")
    private Long phone;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="org_id")
    private Organization organization;

}
