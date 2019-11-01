package merrymac.sunshinecontacts.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@AllArgsConstructor
@Entity
public class People {
    @Id
    private Long id;
    private String name;

}
