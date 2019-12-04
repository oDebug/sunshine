package merrymac.sunshinecontacts.dao.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "addresses", schema = "sunshine")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Address implements Serializable {
    @Id
    @Column(name="id", updatable=false, nullable=false)
    private Long id;

    @Column(name="contact_id", updatable = false)
    private Long contactId;

    @Column(name="street")
    private String street;

    @Column(name="suite")
    private String suite;

    @Column(name="city")
    private String city;

    @Column(name="state")
    private String state;

    @Column(name="postal_code")
    private Long postalCode;

    @Column(name="address_type")
    private String addressType;
}
