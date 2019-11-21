package merrymac.sunshinecontacts.dao.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "phone_numbers", schema = "sunshine")
@Data
@NoArgsConstructor
public class PhoneNumber {
    @Id
    @Column(name = "id", updatable = false, nullable = false)
    private Long id;

    @Column(name = "org_id", insertable = false, updatable = false)
    private Long orgId;

    @Column(name = "phone")
    private Long phone;

    @Column(name="phone_type")
    private String type;

}