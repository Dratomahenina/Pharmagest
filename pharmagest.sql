PGDMP  &                    |         
   pharmagest    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16397 
   pharmagest    DATABASE     }   CREATE DATABASE pharmagest WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';
    DROP DATABASE pharmagest;
                postgres    false            �            1255    16602    update_date_creation()    FUNCTION     �   CREATE FUNCTION public.update_date_creation() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.date_creation := CURRENT_DATE;
    RETURN NEW;
END;
$$;
 -   DROP FUNCTION public.update_date_creation();
       public          postgres    false            �            1259    16595    client    TABLE     l  CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom_client character varying(50) NOT NULL,
    prenom_client character varying(50) NOT NULL,
    date_naissance_client date,
    adresse_client character varying(200),
    telephone_client character varying(20),
    nom_medecin character varying(100),
    date_creation date DEFAULT CURRENT_DATE
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    16594    client_id_client_seq    SEQUENCE     �   CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_id_client_seq;
       public          postgres    false    218            �           0    0    client_id_client_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;
          public          postgres    false    217            �            1259    16398    utilisateurs_id_utilisateur_seq    SEQUENCE     �   CREATE SEQUENCE public.utilisateurs_id_utilisateur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.utilisateurs_id_utilisateur_seq;
       public          postgres    false            �            1259    16399    utilisateurs    TABLE     �  CREATE TABLE public.utilisateurs (
    id_utilisateur integer DEFAULT nextval('public.utilisateurs_id_utilisateur_seq'::regclass) NOT NULL,
    nom_utilisateur character varying(255) NOT NULL,
    mot_de_passe character varying(255) NOT NULL,
    role character varying(50) NOT NULL,
    prenom_utilisateur character varying(50),
    email_utilisateur character varying(100),
    adresse_utilisateur character varying(200),
    telephone_utilisateur character varying(20),
    date_creation date
);
     DROP TABLE public.utilisateurs;
       public         heap    postgres    false    215            W           2604    16598    client id_client    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN id_client DROP DEFAULT;
       public          postgres    false    218    217    218            �          0    16595    client 
   TABLE DATA           �   COPY public.client (id_client, nom_client, prenom_client, date_naissance_client, adresse_client, telephone_client, nom_medecin, date_creation) FROM stdin;
    public          postgres    false    218   p       �          0    16399    utilisateurs 
   TABLE DATA           �   COPY public.utilisateurs (id_utilisateur, nom_utilisateur, mot_de_passe, role, prenom_utilisateur, email_utilisateur, adresse_utilisateur, telephone_utilisateur, date_creation) FROM stdin;
    public          postgres    false    216   ,       �           0    0    client_id_client_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.client_id_client_seq', 7, true);
          public          postgres    false    217            �           0    0    utilisateurs_id_utilisateur_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.utilisateurs_id_utilisateur_seq', 3, true);
          public          postgres    false    215            \           2606    16601    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            postgres    false    218            Z           2606    16406    utilisateurs utilisateurs_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.utilisateurs
    ADD CONSTRAINT utilisateurs_pkey PRIMARY KEY (id_utilisateur);
 H   ALTER TABLE ONLY public.utilisateurs DROP CONSTRAINT utilisateurs_pkey;
       public            postgres    false    216            ]           2620    16603     utilisateurs user_insert_trigger    TRIGGER     �   CREATE TRIGGER user_insert_trigger BEFORE INSERT ON public.utilisateurs FOR EACH ROW EXECUTE FUNCTION public.update_date_creation();
 9   DROP TRIGGER user_insert_trigger ON public.utilisateurs;
       public          postgres    false    216    219            �   �   x�m��
�0���׫�4��m�gIed�H�@�4��/�(xN����n��"�esd���0N�ݺ���?����P�:K�9ۃB-��*H��|K��	�u����h
X��2��r��վ�B�H��Z�9�y^��Y'����@ʑ2��-Y4m����?�x�s�aO׆5      �   ?   x�3�����Ĕ��<�?d�eę���!�3��3S���s&�dB��Լ��R%1z\\\ s��     