PGDMP  2                    |         
   Pharmagest    16.2    16.2 "    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16628 
   Pharmagest    DATABASE        CREATE DATABASE "Pharmagest" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';
    DROP DATABASE "Pharmagest";
                postgres    false            �            1255    16629    log_user_login()    FUNCTION     c  CREATE FUNCTION public.log_user_login() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    RAISE NOTICE 'Insertion dans la table audit : nom_utilisateur=%, date_connexion=%', NEW.nom_utilisateur, CURRENT_TIMESTAMP;
    INSERT INTO audit (nom_utilisateur, date_connexion)
    VALUES (NEW.nom_utilisateur, CURRENT_TIMESTAMP);
    RETURN NEW;
END;
$$;
 '   DROP FUNCTION public.log_user_login();
       public          postgres    false            �            1259    16630    audit    TABLE     �   CREATE TABLE public.audit (
    id_audit integer NOT NULL,
    nom_utilisateur character varying(255) NOT NULL,
    date_connexion timestamp without time zone NOT NULL
);
    DROP TABLE public.audit;
       public         heap    postgres    false            �            1259    16633    audit_id_audit_seq    SEQUENCE     �   CREATE SEQUENCE public.audit_id_audit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.audit_id_audit_seq;
       public          postgres    false    215                       0    0    audit_id_audit_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.audit_id_audit_seq OWNED BY public.audit.id_audit;
          public          postgres    false    216            �            1259    16634    client    TABLE     �  CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom_client character varying(50) NOT NULL,
    prenom_client character varying(50) NOT NULL,
    date_naissance_client date,
    adresse_client character varying(200),
    telephone_client character varying(20),
    date_creation date DEFAULT CURRENT_DATE,
    statut character varying(20) DEFAULT 'actif'::character varying
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    16638    client_id_client_seq    SEQUENCE     �   CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_id_client_seq;
       public          postgres    false    217                       0    0    client_id_client_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;
          public          postgres    false    218            �            1259    16665    fournisseur    TABLE     �  CREATE TABLE public.fournisseur (
    id_fournisseur integer NOT NULL,
    nom_fournisseur character varying(255) NOT NULL,
    email_fournisseur character varying(255) NOT NULL,
    tel_fournisseur character varying(20) NOT NULL,
    adresse_fournisseur character varying(255) NOT NULL,
    statut character varying(20) DEFAULT 'actif'::character varying,
    date_creation date DEFAULT CURRENT_DATE
);
    DROP TABLE public.fournisseur;
       public         heap    postgres    false            �            1259    16664    fournisseur_id_fournisseur_seq    SEQUENCE     �   CREATE SEQUENCE public.fournisseur_id_fournisseur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.fournisseur_id_fournisseur_seq;
       public          postgres    false    222                       0    0    fournisseur_id_fournisseur_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.fournisseur_id_fournisseur_seq OWNED BY public.fournisseur.id_fournisseur;
          public          postgres    false    221            �            1259    16645    utilisateurs    TABLE     �   CREATE TABLE public.utilisateurs (
    id_utilisateur integer NOT NULL,
    nom_utilisateur character varying(255) NOT NULL,
    mot_de_passe character varying(255) NOT NULL,
    role character varying(50) NOT NULL
);
     DROP TABLE public.utilisateurs;
       public         heap    postgres    false            �            1259    16650    utilisateurs_id_utilisateur_seq    SEQUENCE     �   CREATE SEQUENCE public.utilisateurs_id_utilisateur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.utilisateurs_id_utilisateur_seq;
       public          postgres    false    219                       0    0    utilisateurs_id_utilisateur_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.utilisateurs_id_utilisateur_seq OWNED BY public.utilisateurs.id_utilisateur;
          public          postgres    false    220            `           2604    16651    audit id_audit    DEFAULT     p   ALTER TABLE ONLY public.audit ALTER COLUMN id_audit SET DEFAULT nextval('public.audit_id_audit_seq'::regclass);
 =   ALTER TABLE public.audit ALTER COLUMN id_audit DROP DEFAULT;
       public          postgres    false    216    215            a           2604    16652    client id_client    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN id_client DROP DEFAULT;
       public          postgres    false    218    217            e           2604    16668    fournisseur id_fournisseur    DEFAULT     �   ALTER TABLE ONLY public.fournisseur ALTER COLUMN id_fournisseur SET DEFAULT nextval('public.fournisseur_id_fournisseur_seq'::regclass);
 I   ALTER TABLE public.fournisseur ALTER COLUMN id_fournisseur DROP DEFAULT;
       public          postgres    false    222    221    222            d           2604    16654    utilisateurs id_utilisateur    DEFAULT     �   ALTER TABLE ONLY public.utilisateurs ALTER COLUMN id_utilisateur SET DEFAULT nextval('public.utilisateurs_id_utilisateur_seq'::regclass);
 J   ALTER TABLE public.utilisateurs ALTER COLUMN id_utilisateur DROP DEFAULT;
       public          postgres    false    220    219                       0    16630    audit 
   TABLE DATA           J   COPY public.audit (id_audit, nom_utilisateur, date_connexion) FROM stdin;
    public          postgres    false    215   N)                 0    16634    client 
   TABLE DATA           �   COPY public.client (id_client, nom_client, prenom_client, date_naissance_client, adresse_client, telephone_client, date_creation, statut) FROM stdin;
    public          postgres    false    217   k)                 0    16665    fournisseur 
   TABLE DATA           �   COPY public.fournisseur (id_fournisseur, nom_fournisseur, email_fournisseur, tel_fournisseur, adresse_fournisseur, statut, date_creation) FROM stdin;
    public          postgres    false    222   �*                 0    16645    utilisateurs 
   TABLE DATA           [   COPY public.utilisateurs (id_utilisateur, nom_utilisateur, mot_de_passe, role) FROM stdin;
    public          postgres    false    219   +                  0    0    audit_id_audit_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.audit_id_audit_seq', 41, true);
          public          postgres    false    216                       0    0    client_id_client_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.client_id_client_seq', 7, true);
          public          postgres    false    218                       0    0    fournisseur_id_fournisseur_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.fournisseur_id_fournisseur_seq', 4, true);
          public          postgres    false    221                       0    0    utilisateurs_id_utilisateur_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.utilisateurs_id_utilisateur_seq', 44, true);
          public          postgres    false    220            i           2606    16656    audit audit_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.audit
    ADD CONSTRAINT audit_pkey PRIMARY KEY (id_audit);
 :   ALTER TABLE ONLY public.audit DROP CONSTRAINT audit_pkey;
       public            postgres    false    215            k           2606    16658    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    217            o           2606    16672    fournisseur fournisseur_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.fournisseur
    ADD CONSTRAINT fournisseur_pkey PRIMARY KEY (id_fournisseur);
 F   ALTER TABLE ONLY public.fournisseur DROP CONSTRAINT fournisseur_pkey;
       public            postgres    false    222            m           2606    16662    utilisateurs utilisateurs_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.utilisateurs
    ADD CONSTRAINT utilisateurs_pkey PRIMARY KEY (id_utilisateur);
 H   ALTER TABLE ONLY public.utilisateurs DROP CONSTRAINT utilisateurs_pkey;
       public            postgres    false    219            p           2620    16663    utilisateurs trigger_user_login    TRIGGER     }   CREATE TRIGGER trigger_user_login AFTER INSERT ON public.utilisateurs FOR EACH ROW EXECUTE FUNCTION public.log_user_login();
 8   DROP TRIGGER trigger_user_login ON public.utilisateurs;
       public          postgres    false    219    223                   x������ � �           x�e�MN�0���> F�M�%!��T�-�)q[K���$�G�(=G.�CDA�ƫ�o������g�xm4e�
\�8X�X�"٢���ot	R�25&���w�Bd-�o`��6s5���\�PG��D�O��%:}��4]l�ڵ�J���k[�h�<l��q�+C��L�!�0�v�ؐf ����ǔ�_k.��J鵬���~��.t��xޡ�#r�a �8�+�Hv�|O��q�\��v��u�c8Ý��nr�J��]�Ս�u��Xv^so�EQ|yszm         t   x�e�1
�0��9=�Pl������%�*��Bk=����-��9�tqή$�8��}gc ]�5��Yb�do> {���2�BI���eK�����ARFRFP�J|���SJ�[�E�         9   x�3�L�KɄe�y)��E\��ٙ�`������eę���!�3��3S��b���� i�     