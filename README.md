# Rapport de TP - Commande Articulaire d’un Robot Manipulateur RP

## Université Toulouse III Paul Sabatier - UPSSITECH
**Travaux Pratiques 2ASRI**

### Sujet : Commande Articulaire d’un Robot Manipulateur de Type RP
Ce document présente les étapes de simulation sous MATLAB-SIMULINK de diverses stratégies de commande articulaire pour un bras manipulateur élémentaire de type RP.

---

### **I. Présentation du robot**
Le robot est modélisé dans un repère orthonormé \( R_0 = (O_0, x_0, y_0, z_0) \). Il s’agit d’un manipulateur à chaîne cinématique ouverte avec :
- Une liaison rotoïde \( L_1 \) pivotant autour de \( z_0 \) (coordonnée \( q_1 \)),
- Une liaison prismatique \( L_2 \) reliant \( O_0 \) à \( O_3 \) (distance paramétrée par \( q_2 \)).

Les consignes de position \( q_1(t) \) et \( q_2(t) \) sont générées à partir de lois horaires correspondant à des mouvements uniformément accélérés, constants, puis décélérés.

---

### **II. Travail demandé**
#### **II.1 Prise en main et calculs préliminaires**
1. **Démarrage** :
   - Lancer MATLAB/SIMULINK.
   - Importer les blocs `profils_de_consigne_axes_1_et_2` et `robot_RP` de la librairie `lib_robotRP`.

2. **Étude des rapports de réduction \( r \in \{1/200, 1/30, 1\} \)** :
   - Identifier les inerties efficaces \( J_{\text{eff}i} = J_m + r^2 m \),
   - Simuler avec différentes perturbations \( d_1, d_2 \).

---

#### **II.2 Commande en vitesse de type PD**
3. **Synthèse analytique** :
   - Loi : \( V_i(p) = K(\Theta^*_m(p) - \Theta_m(p)) - K_D p\Theta_m(p) \),
   - Déterminer \( K \) et \( K_D \) pour un amortissement unitaire.

4. **Étapes d’analyse** :
   - Calcul des coefficients pour \( \epsilon_{1i}/\Theta_{1mi} = 1/2 \),
   - Simulations sous SIMULINK :
     - Réponse pour des consignes échelons (position et vitesse),
     - Effet des perturbations \( r d_i \),
     - Introduction de la gravitation.

5. **Conclusions** :
   - Valider l’approximation linéaire,
   - Étudier l’influence de la gravitation.

---

#### **II.3 Commande en vitesse de type PID**
6. **Amélioration** :
   - Ajuster \( T_I \) via des lieux de transfert,
   - Implémenter une commande PID dans SIMULINK.

---

#### **II.4 Retour sur la modélisation**
7. **Justification** :
   - Relier \( J_{\text{eff}i} \) et \( r d_i \) aux modèles dynamiques,
   - Calcul des valeurs extrêmes et choix optimal.

---

#### **II.5 Commande non linéaire centralisée par anticipation**
8. **Feedforward** :
   - Déterminer l’expression théorique du terme d’anticipation,
   - Compléter le code `sf_loi_avant_RP.m`.

9. **Comparaison** :
   - Simuler pour \( r \in \{1/200, 1/30, 1\} \),
   - Comparer les avantages et inconvénients.

---

#### **II.6 Commande non linéaire centralisée par découplage**
10. **Linéarisation** :
    - Synthétiser une commande linéarisante avec double intégrateur.

11. **Implémentation** :
    - Compléter `sf_retour_linearisant_RP.m`,
    - Tester pour \( r \in \{1/200, 1/30, 1\} \).

---

### **Conclusions générales**
- Analyse des performances des stratégies PD, PID, et non linéaires,
- Validation des modèles dynamiques et robustesse face à la gravitation et perturbations,
- Comparaison des rapports de réduction et de leurs impacts sur la commande.

**Note** : Les fichiers SIMULINK et les codes MATLAB associés sont nécessaires pour la reproduction des simulations.

