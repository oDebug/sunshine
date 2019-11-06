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
@Table(name = "org_alias", schema = "sunshine")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrgAlias implements Serializable {
    @Id
    @GeneratedValue
    @Column(name="id", updatable=false, nullable=false)
    private Long id;

    @Column(name="org_name")
    private String alias;

    @Column(name="org_id", insertable = false, updatable = false)
    private Long org_id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="org_id")
    private Organization organization;

}
