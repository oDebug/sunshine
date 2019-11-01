package merrymac.sunshinecontacts.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Organization {
    @Id
    private Long id;
    private String name;
    private String type;

}
