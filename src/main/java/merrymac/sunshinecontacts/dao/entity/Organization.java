package merrymac.sunshinecontacts.dao.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
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

    @OneToMany(
            mappedBy = "organization",
            cascade = CascadeType.ALL,
            orphanRemoval = true
    )
    private List<OrgPhone> phone = new ArrayList<>();

}
