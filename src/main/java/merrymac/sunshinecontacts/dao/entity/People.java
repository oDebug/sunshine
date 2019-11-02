package merrymac.sunshinecontacts.dao.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@Table(name = "people", schema = "sunshine")
@AllArgsConstructor
@Entity
public class People {
    @Id
    private Long id;
    private String name;

}
