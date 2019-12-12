package merrymac.sunshinecontacts.dao.entity;


import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "socials", schema = "sunshine")
@Data
@NoArgsConstructor
public class SocialMedia {
    @Id
    @Column(name = "id", updatable = false, nullable = false)
    private Long id;

    @Column(name = "contact_id", updatable = false)
    private Long contactId;

    @Column(name = "sm_type")
    private String socialMediaType;

    @Column(name="sm_address")
    private String socialMediaAddress;
}
