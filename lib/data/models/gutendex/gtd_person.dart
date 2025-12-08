class GtdPerson {
    GtdPerson({
        required this.name,
        required this.birthYear,
        required this.deathYear,
    });

    final String? name;
    final int? birthYear;
    final int? deathYear;

    GtdPerson copyWith({
        String? name,
        int? birthYear,
        int? deathYear,
    }) {
        return GtdPerson(
            name: name ?? this.name,
            birthYear: birthYear ?? this.birthYear,
            deathYear: deathYear ?? this.deathYear,
        );
    }

    factory GtdPerson.fromJson(Map<String, dynamic> json){ 
        return GtdPerson(
            name: json["name"],
            birthYear: json["birth_year"],
            deathYear: json["death_year"],
        );
    }

    Map<String, dynamic> toJson() => {
        "name": name,
        "birth_year": birthYear,
        "death_year": deathYear,
    };

    @override
    String toString(){
        return "$name, $birthYear, $deathYear, ";
    }

}

/*
{
	"name": "Garnett, Constance",
	"birth_year": 1861,
	"death_year": 1946
}*/