from flask_sqlalchemy import SQLAlchemy
from .views import app

db = SQLAlchemy(app)

class Pathology(db.Model):
    __tablename__ = "pathology"
    __bind_key__ = "pathology"

    id = db.Column(db.Integer(), primary_key=True)
    name = db.Column(db.String(), nullable=False)
    info = db.Column(db.String(), nullable=False)
    has = db.Column(db.String(), nullable=True)
    age_min = db.Column(db.Integer, nullable=False)
    age_max = db.Column(db.Integer, nullable=False)
    sex = db.Column(db.String(), nullable=False)
    symptoms = db.Column(db.String(), nullable=False)
    other_name = db.Column(db.String(), nullable=True)
    norm_name = db.Column(db.String(), nullable=False)
    description = db.Column(db.String(), nullable=False)
    icd_10 = db.Column(db.String(), nullable=False)
    rec_tests_string = db.Column(db.String(), nullable=True)
    rec_tests = db.Column(db.PickleType, nullable=False)
    created_on = db.Column(db.DateTime, server_default=db.func.now(tz=app.config['TIMEZONE']))
    updated_by = db.Column(db.Integer, nullable=True)
    updated_on = db.Column(db.DateTime, server_default=db.func.now(tz=app.config['TIMEZONE']))
    user_id = db.Column(db.Integer, nullable=False)
    treatment = db.Column(db.String(), nullable=True)
    specialty = db.relationship('Specialty', secondary='pathology_specialty')

    def __init__(self, name, info, symptoms, age_min, age_max, sex, user_id, rec_tests = [], has = None,
                other_name = None, rec_tests_string = "",updated_by = None, updated_on = None, treatment = None,
                description = None, icd_10 = None):
        self.name = name
        self.info = info
        self.age_min = age_min
        self.age_max = age_max
        self.sex = sex
        self.has = has
        self.description = description
        self.icd_10 = icd_10
        self.symptoms = symptoms
        self.other_name = other_name
        self.rec_tests = rec_tests
        self.rec_tests_string = rec_tests_string
        self.norm_name = pt.strip_accents(name.lower().strip())
        self.user_id = user_id
        self.updated_by = updated_by
        self.updated_on = updated_on
        self.treatment = treatment

    def __repr__(self):
        return "<Pathology(pathology=%s)>" %(self.name)

    def __str__(self):
        return self.name


class Specialty(db.Model):
    """
    Define pathology specialty
    """
    __tablename__ = "specialty"
    id = db.Column(db.Integer(), primary_key=True)
    name = db.Column(db.String(50), unique=True)

    def __repr__(self):
        return "<Specialty(name=%s)>" %(self.name)


class PathologySpecialty(db.Model):
    """
    Interface between pathology and specialty
    """
    __tablename__ = 'pathology_specialty'
    id = db.Column(db.Integer(), primary_key=True)
    pathology_id = db.Column(db.Integer(), db.ForeignKey('pathology.id', ondelete='CASCADE'))
    specialty_id = db.Column(db.Integer(), db.ForeignKey('specialty.id', ondelete='CASCADE'))

class Role(db.Model):
    """
    Define user roles
    """
    __tablename__ = 'roles'
    id = db.Column(db.Integer(), primary_key=True)
    name = db.Column(db.String(50), unique=True)

    def __init__(self, name):
        self.name = name

    def __repr__(self):
        return "<Role(name=%s)>" %(self.name)


class UserRoles(db.Model):
    """
    Interface between user and roles
    """
    __tablename__ = 'user_roles'
    id = db.Column(db.Integer(), primary_key=True)
    user_id = db.Column(db.Integer(), db.ForeignKey('user.id', ondelete='CASCADE'))
    role_id = db.Column(db.Integer(), db.ForeignKey('roles.id', ondelete='CASCADE'))

class User(db.Model):
    __tablename__="user"
    __bind__="user"
    id = db.Column(db.Integer, primary_key=True, nullable=False)
    email = db.Column(db.String(50), unique=True)
    rpps =  db.Column(db.BigInteger, unique=True)
    password = db.Column(db.String(100))
    name = db.Column(db.String(50), nullable=False)
    forename = db.Column(db.String(50), nullable=False)
    registered_on = db.Column(db.DateTime, server_default=db.func.now(tz=app.config['TIMEZONE']))
    confirmed = db.Column(db.Boolean, nullable=False, default=False)
    confirmed_on = db.Column(db.DateTime, nullable=True)
    entry_count_patient = db.Column(db.Integer, nullable=False, default=0)
    entry_count_pathology = db.Column(db.Integer, nullable=False, default=0)
    modify_count_patient = db.Column(db.Integer, nullable=False, default=0)
    modify_count_pathology = db.Column(db.Integer, nullable=False, default=0)
    phone = db.Column(db.String(20), nullable=False, unique=True)
    zip_code = db.Column(db.String(20), nullable=False)
    # roles = db.relationship('Role', secondary='user_roles')

    def __init__(self, name, forename, rpps, email, password, confirmed=True, confirmed_on = None, entry_count_patient=0, entry_count_pathology=0, modify_count_patient=0, modify_count_pathology=0, phone=0, zip_code=0) :
        self.rpps = rpps
        self.password = password
        self.email = email
        self.forename = forename
        self.name = name
        self.confirmed_on = confirmed_on
        self.confirmed = confirmed
        self.entry_count_patient = entry_count_patient
        self.entry_count_pathology = entry_count_pathology
        self.modify_count_patient = modify_count_patient
        self.modify_count_pathology = modify_count_pathology
        self.phone = phone
        self.zip_code = zip_code

    def __repr__(self):
        return "<User(forename=%s, name=%s, rpps=%d, email=%s)>" %(self.forename, self.name, self.rpps,self.email)
