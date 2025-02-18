PGDMP                     	    u        
   Segreteria    10.0    10.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       1262    16413 
   Segreteria    DATABASE     �   CREATE DATABASE "Segreteria" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Italian_Italy.1252' LC_CTYPE = 'Italian_Italy.1252';
    DROP DATABASE "Segreteria";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            
           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    17269    corso    TABLE     T   CREATE TABLE corso (
    codice bigint NOT NULL,
    nome character varying(255)
);
    DROP TABLE public.corso;
       public         postgres    false    3            �            1259    17259    gruppo    TABLE     Q   CREATE TABLE gruppo (
    id bigint NOT NULL,
    nome character varying(255)
);
    DROP TABLE public.gruppo;
       public         postgres    false    3            �            1259    17264 	   indirizzo    TABLE     X   CREATE TABLE indirizzo (
    codice bigint NOT NULL,
    nome character varying(255)
);
    DROP TABLE public.indirizzo;
       public         postgres    false    3            �            1259    17257    sequenza_id    SEQUENCE     m   CREATE SEQUENCE sequenza_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.sequenza_id;
       public       postgres    false    3            �            1259    17274    studente    TABLE     �   CREATE TABLE studente (
    matricola character(8) NOT NULL,
    nome character varying(255),
    cognome character varying(255),
    data_nascita date,
    gruppo_id bigint,
    indirizzo_codice bigint,
    corso_codice bigint
);
    DROP TABLE public.studente;
       public         postgres    false    3                      0    17269    corso 
   TABLE DATA               &   COPY corso (codice, nome) FROM stdin;
    public       postgres    false    199   �                  0    17259    gruppo 
   TABLE DATA               #   COPY gruppo (id, nome) FROM stdin;
    public       postgres    false    197   �                 0    17264 	   indirizzo 
   TABLE DATA               *   COPY indirizzo (codice, nome) FROM stdin;
    public       postgres    false    198                    0    17274    studente 
   TABLE DATA               n   COPY studente (matricola, nome, cognome, data_nascita, gruppo_id, indirizzo_codice, corso_codice) FROM stdin;
    public       postgres    false    200   g                  0    0    sequenza_id    SEQUENCE SET     2   SELECT pg_catalog.setval('sequenza_id', 5, true);
            public       postgres    false    196            �
           2606    17273    corso corso_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY corso
    ADD CONSTRAINT corso_pkey PRIMARY KEY (codice);
 :   ALTER TABLE ONLY public.corso DROP CONSTRAINT corso_pkey;
       public         postgres    false    199            |
           2606    17263    gruppo gruppo_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY gruppo
    ADD CONSTRAINT gruppo_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.gruppo DROP CONSTRAINT gruppo_pkey;
       public         postgres    false    197            ~
           2606    17268    indirizzo indirizzo_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY indirizzo
    ADD CONSTRAINT indirizzo_pkey PRIMARY KEY (codice);
 B   ALTER TABLE ONLY public.indirizzo DROP CONSTRAINT indirizzo_pkey;
       public         postgres    false    198            �
           2606    17281    studente studente_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY studente
    ADD CONSTRAINT studente_pkey PRIMARY KEY (matricola);
 @   ALTER TABLE ONLY public.studente DROP CONSTRAINT studente_pkey;
       public         postgres    false    200            �
           2606    17292 #   studente studente_corso_codice_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY studente
    ADD CONSTRAINT studente_corso_codice_fkey FOREIGN KEY (corso_codice) REFERENCES corso(codice);
 M   ALTER TABLE ONLY public.studente DROP CONSTRAINT studente_corso_codice_fkey;
       public       postgres    false    2688    199    200            �
           2606    17282     studente studente_gruppo_id_fkey    FK CONSTRAINT     t   ALTER TABLE ONLY studente
    ADD CONSTRAINT studente_gruppo_id_fkey FOREIGN KEY (gruppo_id) REFERENCES gruppo(id);
 J   ALTER TABLE ONLY public.studente DROP CONSTRAINT studente_gruppo_id_fkey;
       public       postgres    false    2684    200    197            �
           2606    17287 '   studente studente_indirizzo_codice_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY studente
    ADD CONSTRAINT studente_indirizzo_codice_fkey FOREIGN KEY (indirizzo_codice) REFERENCES indirizzo(codice);
 Q   ALTER TABLE ONLY public.studente DROP CONSTRAINT studente_indirizzo_codice_fkey;
       public       postgres    false    200    198    2686               7   x�3�OMRp��-(-��K�2���KOM�K-�LTHI�Q�O+)O,J����� q��             x������ � �         F   x�3�I�IM��-��LN������2���+I���LOͫJTp,*�L�L�L�IUHU�O�/*����� �!o         e   x�5̱@0F����r�޶����`�4Hti�q�/G�͢�W�!�>.{�6M�*,�y���O��4zL۱��bq��Q
�+Ř�3��G�fV�X6�1GsAD7FG     